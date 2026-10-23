<template>
  <div v-loading="loading">
    <el-row :gutter="16" style="margin-bottom: 16px">
      <el-col :span="6">
        <el-card shadow="hover">
          <div style="color: #909399; font-size: 14px">今日预约</div>
          <div style="font-size: 32px; font-weight: 600">{{ metrics.today_reservations }}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <div style="color: #909399; font-size: 14px">今日签到</div>
          <div style="font-size: 32px; font-weight: 600; color: #67C23A">{{ metrics.today_attendance }}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <div style="color: #909399; font-size: 14px">今日迟到</div>
          <div style="font-size: 32px; font-weight: 600; color: #E6A23C">{{ metrics.today_late }}</div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <div style="color: #909399; font-size: 14px">开放实验室</div>
          <div style="font-size: 32px; font-weight: 600; color: #409EFF">{{ metrics.active_labs }}</div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="16">
      <el-col :span="16">
        <el-card shadow="hover" header="近 7 天签到趋势">
          <v-chart :option="lineOption" style="height: 320px" autoresize />
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="hover" header="签到状态分布">
          <v-chart :option="pieOption" style="height: 320px" autoresize />
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { LineChart, PieChart } from 'echarts/charts'
import { GridComponent, TooltipComponent, LegendComponent, TitleComponent } from 'echarts/components'
import VChart from 'vue-echarts'
import api from '../api'

use([CanvasRenderer, LineChart, PieChart, GridComponent, TooltipComponent, LegendComponent, TitleComponent])

const loading = ref(true)
const metrics = ref({
  today_reservations: 0,
  today_attendance: 0,
  today_late: 0,
  active_labs: 0,
})
const chart7d = ref([])
const statusDist = ref({ normal: 0, late: 0 })

const lineOption = computed(() => ({
  tooltip: { trigger: 'axis' },
  xAxis: { 
    type: 'category', 
    data: chart7d.value.map((x) => x.date) 
  },
  yAxis: { 
    type: 'value',
    minInterval: 1, // <-- ВОТ ЭТО ИСПРАВЛЯЕТ ГРАФИК (шаг целыми числами)
    min: 0          // <-- Начинаем строго с нуля
  },
  series: [
    {
      name: '签到数',
      type: 'line',
      smooth: true,
      data: chart7d.value.map((x) => x.count),
      areaStyle: { opacity: 0.3 },
      itemStyle: { color: '#409EFF' },
    },
  ],
}))

const pieOption = computed(() => ({
  tooltip: { trigger: 'item' },
  legend: { bottom: 0 },
  series: [
    {
      name: '签到状态',
      type: 'pie',
      radius: ['40%', '70%'],
      data: [
        { value: statusDist.value.normal, name: '正常', itemStyle: { color: '#67C23A' } },
        { value: statusDist.value.late, name: '迟到', itemStyle: { color: '#E6A23C' } },
      ],
    },
  ],
}))

onMounted(async () => {
  try {
    const { data } = await api.get('/dashboard/summary/')
    metrics.value = data.metrics
    chart7d.value = data.chart_7d
    statusDist.value = data.status_distribution
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
})
</script>