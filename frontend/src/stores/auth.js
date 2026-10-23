import { defineStore } from 'pinia'
import axios from 'axios'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    accessToken: localStorage.getItem('access_token') || '',
    refreshToken: localStorage.getItem('refresh_token') || '',
    user: JSON.parse(localStorage.getItem('user') || 'null'),
  }),
  getters: {
    isAuthenticated: (state) => !!state.accessToken,
    role: (state) => state.user?.role || null,
  },
  actions: {
    setAccessToken(token) {
      this.accessToken = token
      localStorage.setItem('access_token', token)
    },
    async login(username, password) {
      const { data } = await axios.post('/api/auth/login/', { username, password })
      this.accessToken = data.access
      this.refreshToken = data.refresh
      localStorage.setItem('access_token', data.access)
      localStorage.setItem('refresh_token', data.refresh)

      const me = await axios.get('/api/users/me/', {
        headers: { Authorization: `Bearer ${data.access}` },
      })
      this.user = me.data
      localStorage.setItem('user', JSON.stringify(me.data))
    },
    logout() {
      this.accessToken = ''
      this.refreshToken = ''
      this.user = null
      localStorage.removeItem('access_token')
      localStorage.removeItem('refresh_token')
      localStorage.removeItem('user')
    },
  },
})