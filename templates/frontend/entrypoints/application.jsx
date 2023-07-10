import '@/assets/stylesheets/application.sass'
import 'react-toastify/dist/ReactToastify.css'

import React from 'react'
import { ToastContainer } from 'react-toastify'
import { CssBaseline, ThemeProvider } from '@mui/material'
import { createRoot } from 'react-dom/client'
import { RouterProvider } from 'react-router-dom'
import router from '@/router'
import { Provider } from 'react-redux'
import { store } from '@/store'
import { theme } from '@/theme'

const container = document.getElementById('root')
const root = createRoot(container)

root.render(
  <React.StrictMode>
    <CssBaseline />
    <ToastContainer />
    <Provider store={store}>
      <ThemeProvider theme={theme}>
        <RouterProvider router={router} />
      </ThemeProvider>
    </Provider>
  </React.StrictMode>
)
