import { Box, Divider, Stack, Typography } from '@mui/material'
import PropTypes from 'prop-types'

const PageLayout = ({ title, children }) => {
  return (
    <Stack>
      <Box sx={{mb:2}}>
        <Typography gutterBottom variant='h5' sx={{ fontWeight: 'bold' }}>{title}</Typography>
        <Divider />
      </Box>

      <div>
        {children}
      </div>
    </Stack>
  )
}

PageLayout.propTypes = {
  title: PropTypes.string,
  children: PropTypes.node
}

PageLayout.defaultProps = {
  title: 'Custom'
}

export default PageLayout
