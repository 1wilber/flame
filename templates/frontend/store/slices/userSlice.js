import { createAsyncThunk, createSlice } from '@reduxjs/toolkit'
import { usersService } from '@/services/users-service'
import { toast } from 'react-toastify'

const validateCurrentUser = createAsyncThunk(
  'user/current-user',
  async (_, { rejectWithValue }) => {
    try {
      const response = await usersService.currentUser()
      return response
    } catch ({ response }) {
      throw rejectWithValue(response.data)
    }
  }
)

const initialState = {
  isLogged: false
}

export const userSlice = createSlice({
  name: 'user',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(validateCurrentUser.fulfilled, (state, action) => {
      state.isLogged = true
    })

    builder.addCase(validateCurrentUser.rejected, (state, action) => {
      state.isLogged = false
      toast.error(action.payload.error)
    })
  }
})

// export const { increment, decrement, incrementByAmount } = userSlice.actions

export {
  validateCurrentUser
}
export default userSlice.reducer
