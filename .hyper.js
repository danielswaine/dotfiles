const css = `
  .hyper_main {
    border-color: #282828 !important;
  }

  .tabs_title {
    color: #ebdbb2;
  }
`

module.exports = {
  config: {
    css,
    fontSize: 14,
    padding: '4px',
    bell: false,

    hypercwd: {
      initialWorkingDirectory: '~/Projects'
    }
  },

  plugins: [
    'hyperterm-gruvbox-dark',
    'hypercwd'
    // 'hyperterm-alternatescroll'
  ]
}
