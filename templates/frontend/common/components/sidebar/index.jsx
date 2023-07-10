import { List, ListSubheader } from '@mui/material/'

import { Home as HomeIcon } from '@mui/icons-material/'
import { styled } from '@mui/system'
import { SidebarLink } from './sidebar-link'

const Sidebar = () => {
  const SidebarContainer = styled('nav')({
    display: 'flex',
    padding: 10,
    pr: 0,
    flex: 1
  })

  const SidebarSubHeader = styled(ListSubheader)(({ theme }) => ({
    fontSize: 18,
    fontWeight: 'bold',
    pl: 0,
    backgroundColor: theme.palette.background.default
  }))

  return (
    <SidebarContainer>
      <List
        sx={{
          width: '100%',
          maxWidth: '100%',
          fontSize: '1.5rem'
        }}
        component='nav'
        subheader={
          <SidebarSubHeader>
            General
          </SidebarSubHeader>
        }
      >
        <SidebarLink to='/' label='Home' icon={<HomeIcon />} />

      </List>
    </SidebarContainer>
  )
}
export default Sidebar
