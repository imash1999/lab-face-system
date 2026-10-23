<template>
  <el-card>
    <el-table :data="labs" v-loading="loading" stripe>
      <el-table-column prop="code" label="编号" width="120" />
      <el-table-column prop="name" label="名称" />
      <el-table-column prop="location" label="位置" />
      <el-table-column prop="capacity" label="容量" width="80" />
      <el-table-column label="状态" width="100">
        <template #default="{ row }">
          <el-tag :type="row.status === 'open' ? 'success' : 'info'">
            {{ row.status === 'open' ? '开放' : '停用' }}
          </el-tag>
        </template>
      </el-table-column>
    </el-table>
  </el-card>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import api from '../api'

const labs = ref([])
const loading = ref(true)

onMounted(async () => {
  try {
    const { data } = await api.get('/labs/')
    labs.value = data.results || data
  } finally {
    loading.value = false
  }
})
</script>