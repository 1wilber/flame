import { Box, Card } from '@mui/material'

const Content = ({ children }) => {
  return (
    <Box sx={{ m: 1, boxShadow: 3 }} component={Card} flex={7} px={3} py={2}>
      {children}
    </Box>
  )
}

export default Content
