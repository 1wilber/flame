import { defineConfig } from 'vite'
import path from 'path'
import RubyPlugin from 'vite-plugin-ruby'
import react from '@vitejs/plugin-react-swc'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    react()
  ],
  resolve: {
    alias: [
      { find: '@', replacement: path.resolve(__dirname, 'app/frontend') }
    ]
  }
})
