import Home from '@/pages/home'
import SignIn from '@/pages/sign-in'
import { Navigate, Outlet, createBrowserRouter } from 'react-router-dom'
import { useSelector } from 'react-redux'
import { validateCurrentUser } from '@/store/slices/userSlice'
import { store } from '@/store'
import MainLayout from '@/layouts/main-layout'

const PrivateRoute = () => {
  const user = useSelector(state => state.user)
  console.log(user)
  return (
    user.isLogged ? <MainLayout><Outlet /></MainLayout> : <Navigate to='/sign_in' />
  )
}

const router = createBrowserRouter([
  {
    element: <PrivateRoute />,
    loader: () => {
      return store.dispatch(validateCurrentUser())
    },
    children: [
      {
        path: '/',
        element: <Home />,
        exact: true
      },
      {
        path: '/home',
        element: <Home />,
        exact: true
      }
    ]
  },
  {
    path: '/sign_in',
    element: <SignIn />

  }
])

export default router
