import { Button, Typography } from '@mui/material'
import { useNavigate } from 'react-router-dom'
import { usersService } from '@/services/users-service'
import PageLayout from '@/layouts/page-layout'

const Home = () => {
  const navigate = useNavigate()
  const handleLogout = async () => {
    try {
      await usersService.signOut()
      navigate('/sign_in')
    } catch (e) {
      /* handle error */
    }
  }

  return (
    <PageLayout>
      <Typography variant='h4'>Home</Typography>
      <Button variant='contained' onClick={() => handleLogout()}>Log out</Button>
    </PageLayout>
  )
}

export default Home
