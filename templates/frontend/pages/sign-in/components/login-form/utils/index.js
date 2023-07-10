import usersService from '@/services/users-service'
/**
 * Handle login request for login-form
 * @param {object} params
 * @param {string} params.email - user email
 * @param {string} params.password - user password
 * @returns {void}
 */
export const handleLogin = async (params) => {
  const response = await usersService.login(params)
}
