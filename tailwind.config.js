module.exports = {
  purge: [
    './src/**/*.html',
    './src/**/*.elm',
  ],
  darkMode: "class",
  theme: {
    extend: {
      boxShadow: {
        DEFAULT: ' 3px 5px 5px #00000044',
      }
    }

  },
  variants: {},
  plugins: [require("nightwind")]
}