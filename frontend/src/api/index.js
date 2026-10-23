import axios from 'axios'
import { useAuthStore } from '../stores/auth'
import router from '../router'

const api = axios.create({
  baseURL: '/api',
  timeout: 15000,
})

api.interceptors.request.use((config) => {
  const auth = useAuthStore()
  if (auth.accessToken) {
    config.headers.Authorization = `Bearer ${auth.accessToken}`
  }
  return config
})

api.interceptors.response.use(
  (response) => response,
  async (error) => {
    const auth = useAuthStore()
    const original = error.config
    if (error.response?.status === 401 && !original._retry && auth.refreshToken) {
      original._retry = true
      try {
        const { data } = await axios.post('/api/auth/refresh/', {
          refresh: auth.refreshToken,
        })
        auth.setAccessToken(data.access)
        original.headers.Authorization = `Bearer ${data.access}`
        return api(original)
      } catch {
        auth.logout()
        router.push('/login')
      }
    }
    return Promise.reject(error)
  }
)

export default api