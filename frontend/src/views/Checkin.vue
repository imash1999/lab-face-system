<template>
  <div>
    <el-card style="margin-bottom: 16px">
      <template #header>
        <span>我的签到任务</span>
      </template>
      <el-table :data="tasks" v-loading="loading">
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column label="课程">
          <template #default="{ row }">#{{ row.activity }}</template>
        </el-table-column>
        <el-table-column prop="start_time" label="开始" width="200" />
        <el-table-column prop="end_time" label="结束" width="200" />
        <el-table-column label="操作" width="160">
          <template #default="{ row }">
            <el-button size="small" type="primary" @click="openCheckin(row.id)">
              人脸签到
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-dialog v-model="dialogVisible" title="人脸签到" width="500px">
      <div v-if="!result">
        <el-upload
          :auto-upload="false"
          :show-file-list="false"
          :on-change="onFileChange"
          accept="image/*"
        >
          <el-button>选择照片</el-button>
        </el-upload>
        <div v-if="preview" style="margin-top: 16px; text-align: center">
          <img :src="preview" style="max-width: 100%; max-height: 300px; border-radius: 8px" />
        </div>
        <el-button
          v-if="file"
          type="success"
          style="margin-top: 16px; width: 100%"
          :loading="submitting"
          @click="submit"
        >
          提交核验
        </el-button>
      </div>
      <div v-else>
        <el-result
          :icon="result.success ? 'success' : 'error'"
          :title="result.message"
          :sub-title="result.detail"
        />
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import api from '../api'

const tasks = ref([])
const loading = ref(true)
const dialogVisible = ref(false)
const currentTaskId = ref(null)
const file = ref(null)
const preview = ref('')
const submitting = ref(false)
const result = ref(null)

onMounted(async () => {
  try {
    const { data } = await api.get('/checkin/tasks/')
    tasks.value = data.results || data
  } finally {
    loading.value = false
  }
})

const openCheckin = (id) => {
  currentTaskId.value = id
  file.value = null
  preview.value = ''
  result.value = null
  dialogVisible.value = true
}

const onFileChange = (uploadFile) => {
  file.value = uploadFile.raw
  preview.value = URL.createObjectURL(uploadFile.raw)
}

const submit = async () => {
  submitting.value = true
  try {
    const formData = new FormData()
    formData.append('image', file.value)
    const { data } = await api.post(
      `/checkin/tasks/${currentTaskId.value}/verify/`,
      formData,
      { headers: { 'Content-Type': 'multipart/form-data' } }
    )
    result.value = {
      success: true,
      message: '签到成功',
      detail: `状态: ${data.status} · 时间: ${data.time}`,
    }
  } catch (e) {
    result.value = {
      success: false,
      message: '核验失败',
      detail: e.response?.data?.error || '未知错误',
    }
  } finally {
    submitting.value = false
  }
}
</script>