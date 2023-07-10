import { styled } from '@mui/system'
import LoginForm from './components/login-form'

const SignIn = () => {
  const LayoutLogin = styled('div')({
    width: '100%',
    height: '100%',
    maxWidth: '31.25rem',
    padding: '1rem',
    margin: '0 auto',
    display: 'flex',
    alignItems: 'center'
  })

  return (
    <LayoutLogin>
      <LoginForm />
    </LayoutLogin>
  )
}

export default SignIn
