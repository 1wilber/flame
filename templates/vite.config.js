import { defineConfig } from 'vite'
import path from 'path'
import RubyPlugin from 'vite-plugin-ruby'

export default defineConfig({
  plugins: [
    RubyPlugin(),
  ],
  resolve: {
    alias: [
      { find: '@', replacement: path.resolve(__dirname, 'app/frontend')}
    ]
  }
})
