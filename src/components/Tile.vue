<template>
  <div class="tile-root" ref="tileRef">
    <div class="tile-bottom move">
      <div class="round bottom left"></div>
      {{currentValue}}
      <div class="round bottom right"></div>
    </div>
    <div class="tile-top move">
      <div class="round top left"></div>
      {{currentValue}}
      <div class="round top right"></div>
    </div>
  </div>
</template>

<script>
import { computed, ref, watch } from '@vue/runtime-core'
export default {
  props: {
    value: {default : 0, type: Number}
  },
  setup(props) {
    const tileRef = ref(null)
    const currentValue = ref(props.value)
    const nextValue = ref(null)
    const pad = (num, size) => {
      num = num.toString();
      while (num.length < size) num = "0" + num;
      return num;
    }
    watch(() => props.value, (oldValue, newValue) => {
      tileRef.value.classList.add('triggered')
      setTimeout(() => {
        tileRef.value.classList.remove('triggered')
        currentValue.value = oldValue
        nextValue.value = newValue
      }, 100);
    })
    return {
      tileRef,
      computedValue: computed(() => pad(props.value, 2)),
      currentValue, 
      nextValue
    }
  }
}
</script>

<style lang="scss" scoped>
.tile-root {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 100%;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
  position: relative;
  font-size: 6vw;
  border-radius: 10px;
  box-shadow: 0 8px 2px -2px black;
  @media screen and (min-width: 1200px) {
    & {
      font-size: 65px;
    }
  }
  .tile-top, .tile-bottom {
    position: absolute;
    left: 0;
    width: 100%;
    height: 50%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    overflow: hidden;
    box-sizing: border-box;
    transition: 300ms;
    border-radius: 10px;
    .round {
      $hole-width: 15px;
      width: $hole-width;
      height: $hole-width;
      margin: -$hole-width / 2;
      background-color: var(--very-dark-blue);
      border-radius: 50%;
      flex-shrink: 0;
      @media screen and (max-width: 600px) {
        & {
          $hole-width-mini: 12px;
          width: $hole-width-mini;
          height: $hole-width-mini;
          margin: -$hole-width-mini / 2;
        }
      }
    }
  }
  .tile-top {
    top: 0;
    padding-top: calc(50%);
    transform-origin: bottom;
    // transform: rotateX(180deg);
    background-color: var(--dark-desaturated-blue-dark);
    color: var(--soft-red-dark);
  }
  .tile-bottom {
    bottom: 0;
    padding-bottom: calc(50%);
    background-color: var(--dark-desaturated-blue);
    color: var(--soft-red);
  }
  &.triggered {
    .tile-top.move {
      transform: rotateX(180deg);
    }
  }
}
</style>