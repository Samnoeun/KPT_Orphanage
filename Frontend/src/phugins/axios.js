// import axios from "axios";
// const apiUrl = axios.create({
//     baseURL:import.meta.env.VITE_API_URL,
//     timeout: 5000,
//     headers: {
//         "Content-Type": "application/json",
//         "Accept-Control-Allow-Origin": "*",
//     },
// });

// export default apiUrl;





import axios from 'axios'

const api = axios.create({
    baseURL: import.meta.env.VITE_API_URL,
    headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
    }
})

api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})


export default api