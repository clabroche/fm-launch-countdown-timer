const stack = [
  {
    label: 'interactive-pricing-component-front',
    description: 'Your challenge is to build out this launch countdown timer',
    git: {
      home: 'https://github.com/clabroche/fm-launch-countdown-timer',
      remote: 'git@github.com:clabroche/fm-launch-countdown-timer.git'
    },
    url: 'http://localhost:8080',
    spawnCmd: 'npm',
    spawnArgs: ['run', 'client'],
    spawnOptions: {
      cwd: __dirname,
      env: {

      }
    }
  },
]

module.exports = stack
