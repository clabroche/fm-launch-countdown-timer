<template>
  <stars/>
  <hills/>
  <coming-soon/>
  <countdown/>
  <social/>
</template>

<script>
import ComingSoon from './components/ComingSoon.vue'
import Countdown from './components/Countdown.vue'
import Hills from './components/Hills.vue'
import Social from './components/Social.vue'
import Stars from './components/Stars.vue'

export default {
  name: 'App',
  components: {
    Stars,
    Hills,
    Countdown,
    ComingSoon,
    Social,
  }
}
</script>

<style lang="scss">
@import './assets/fonts/RedHat/index.css';
@import './assets/css/reset.css';
@import './assets/css/colors.scss';
@import '~@fortawesome/fontawesome-free/css/all.min.css';
body, #app {
  font-size: 15px;
  margin: 0;
  text-align: center;
  font-family: RedHat;
  font-weight: 700;
  background: rgb(30,31,41);
  background: linear-gradient(184deg, var(--very-dark-blue) 0%, #251c2c 100%);
  color: white;
  width: 100vw;
  height: 100vh;
}
h1  {font-size: 2em;}
h2  {font-size: 1.9em;}
h3  {font-size: 1.8em;}
h4  {font-size: 1.7em;}
h5  {font-size: 1.6em;}
</style>
