import { Stack } from '@mui/material'
import Content from './content'
import Sidebar from '@/common/components/sidebar'

const MainLayout = ({ children }) => {
  return (
    <Stack sx={{ width: '100%', height: '100%' }} direction='row' justifyContent='flex-start' gap={1}>
      <Sidebar />
      <Content>
        {children}
      </Content>
    </Stack>
  )
}

export default MainLayout
