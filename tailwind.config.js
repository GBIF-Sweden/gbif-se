module.exports = {
    content: [
      './_includes/**/*.html',
      './_layouts/**/*.html',
      './_posts/*.md',
      './_events/*.md',
      './*.md',
      './*.html',
    ],
    darkMode: 'class',
    theme: {
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