import { Button, TextField, Typography } from '@mui/material'
import { CardLogin, Form } from './login-form.styled'
import { useFormik } from 'formik'
import { usersService } from '@/services/users-service'
import validationSchema from './validation-schema'
import { toast } from 'react-toastify'
import { useNavigate } from 'react-router-dom'

const LoginForm = () => {
  const navigate = useNavigate()
  const handleLogin = async (values) => {
    try {
      await usersService.signIn({ user: values })
      navigate('/')
    } catch ({ response }) {
      toast.error(response.data.error)
    }
  }

  const { touched, errors, handleBlur, handleSubmit, handleChange, values } = useFormik({
    initialValues: { email: 'admin@example.com', password: 'admin123' },
    validationSchema,
    onSubmit: handleLogin
  })

  return (
    <CardLogin>
      <Form onSubmit={handleSubmit}>
        <Typography variant='h5' align='center'>
          Sign in to your account
        </Typography>
        <TextField
          fullWidth
          name='email'
          placeholder='john.doe@example.com'
          onChange={handleChange}
          value={values.email}
          error={touched.email && Boolean(errors.email)}
          onBlur={handleBlur}
        />

        <TextField
          fullWidth
          name='password'
          type='password'
          placeholder='********'
          onChange={handleChange}
          value={values.password}
          error={touched.email && Boolean(errors.email)}
          onBlur={handleBlur}
        />
        <Button
          type='submit'
          variant='contained'
        >
          Sign in
        </Button>
        <Typography variant='subtitle2' align='center'>
          Forgot your password?
        </Typography>
      </Form>
    </CardLogin>
  )
}

export default LoginForm
