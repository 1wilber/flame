import { ListItemText, ListItemButton, ListItemIcon } from '@mui/material'
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom'

export const SidebarLink = ({ label, icon, route }) => {
  return (
    <ListItemButton
      component={Link}
      to={route}
      sx={{ py: 0, px: 1 }}
    >
      <ListItemIcon
        sx={{
          minWidth: 30
        }}
      >
        {icon}
      </ListItemIcon>
      <ListItemText
        primaryTypographyProps={{ fontSize: 14, fontWeight: 'medium' }}
        primary={label}
      />
    </ListItemButton>

  )
}

SidebarLink.propTypes = {
  label: PropTypes.string,
  icon: PropTypes.node,
  to: PropTypes.string
}
