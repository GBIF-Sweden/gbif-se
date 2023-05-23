module.exports = {
    content: [
      './_includes/**/*.html',
      './_layouts/**/*.html',
      './_news/*.md',
      './_events/*.md',
      './pages/**/*.md',
      './pages/**/*.html',
      './*.md',
      './*.html',
    ],
    darkMode: 'class',
    theme: {
      container: {
        center: true,
      },
      extend: {
        colors: {
          'gbif-green': '#75b375',
          'gbif-green-light': '#c4dec4',
          'gbif-green-dark': '#61a861',
        },
        fontFamily: {
          sans: [
            'Roboto',
            'ui-sans-serif',
            'system-ui',
            '-apple-system',
            'BlinkMacSystemFont',
            '"Segoe UI"',
            '"Helvetica Neue"',
            'Arial',
            '"Noto Sans"',
            'sans-serif',
            '"Apple Color Emoji"',
            '"Segoe UI Emoji"',
            '"Segoe UI Symbol"',
            '"Noto Color Emoji"',
          ],
          text: [ 
            'Calibri',
            'ui-sans-serif',
            'system-ui',
            '-apple-system',
            'BlinkMacSystemFont',
            '"Segoe UI"',
            'Roboto',
            '"Helvetica Neue"',
            'Arial',
            '"Noto Sans"',
            'sans-serif',
            '"Apple Color Emoji"',
            '"Segoe UI Emoji"',
            '"Segoe UI Symbol"',
            '"Noto Color Emoji"',
          ]
        }
      },
    },
    variants: {},
    plugins: [
      require('@tailwindcss/typography'),
    ],
  }