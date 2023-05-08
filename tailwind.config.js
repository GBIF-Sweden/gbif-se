module.exports = {
    content: [
      './_includes/**/*.html',
      './_layouts/**/*.html',
      './_news/*.md',
      './_events/*.md',
      './*.md',
      './*.html',
    ],
    darkMode: 'class',
    theme: {
      screens: {
        'sm': '576px',
        'md': '768px',
        'lg': '1040px',
      },  
      container: {
        center: true,
      },
      extend: {},
    },
    variants: {},
    plugins: [
      require('@tailwindcss/typography'),
    ],
  }