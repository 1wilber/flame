import api from '@/services/base'

export const usersService = {
  /**
   * Sign in request
   * @param {object} params
   * @param {string} params.user.email - user email
   * @param {string} params.user.password - user password
   * @returns {Promise<object>} - response
   * @example
   * const response = await usersService.signIn({
   *  user: {
   *    email: 'admin@example.com',
   *    password: 'password'
   *  }
   * })
   */
  signIn: (params) => api.post('/users/sign_in', params),
  currentUser: () => api.get('/users/current'),
  signOut: () => api.delete('/users/sign_out')
}
