<template>
  <div class="countdown-root">
    <div class="grid">
      <div class="cell countdown"><tile :value="countDownDayjs.get('date')"/></div>
      <div class="cell countdown"><tile :value="countDownDayjs.get('hours')"/></div>
      <div class="cell countdown"><tile :value="countDownDayjs.get('minutes')"/></div>
      <div class="cell countdown"><tile :value="countDownDayjs.get('seconds')"/></div>
      <div class="cell units"><div class="unit">DAYS</div></div>
      <div class="cell units"><div class="unit">HOURS</div></div>
      <div class="cell units"><div class="unit">MINUTES</div></div>
      <div class="cell units"><div class="unit">SECONDS</div></div>
    </div>
  </div>
</template>

<script>
import { ref } from '@vue/reactivity';
import dayjs from 'dayjs'
import Tile from './Tile.vue'
export default {
  components: { Tile },
  setup() {
    // Init Countdown
    const countDownDayjs = ref(dayjs()
      .set('millisecond', 0)
      .set('second', 0)
      .set('minute', 0)
      .set('hour', 0)
      .set('date', 0))
    let totalSeconds = countDownDayjs.value.add(14, 'days').diff(countDownDayjs.value, 'second')
    countDownDayjs.value = countDownDayjs.value.add(14, 'days')

    setInterval(() => {
      if(totalSeconds>0) {
        countDownDayjs.value = countDownDayjs.value.subtract(1, 'second')
        totalSeconds--
      }
    }, 1000);
    return {
      countDownDayjs
    }
  }
}
</script>

<style lang="scss" scoped>
.countdown-root {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translateX(-50%) translateY(-50%);
  width: 80%;
  max-width: 600px;
  .grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 30px;
    @media screen and (max-width: 600px) {
      & {
        gap: 10px;
      }
    }
    .countdown {
      aspect-ratio: 1;
    }
    .units {
      font-size: 1.5vw;
      font-weight: 400;
      color: var(--grayish-blue);
      letter-spacing: 4px;
      position: relative;
      .unit {
        position: absolute;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
      }
    }
  }
}
</style>