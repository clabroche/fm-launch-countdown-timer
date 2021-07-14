<template>
<div class="social-root">
  <i class="fab fa-facebook" aria-hidden="true"></i>
  <i class="fab fa-pinterest" aria-hidden="true"></i>
  <i class="fab fa-instagram" aria-hidden="true"></i>
</div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
.social-root {
  position: fixed;
  bottom: 40px;
  width: 100vw;
  font-size: normal;
  letter-spacing: 8px;
  font-size: 1.5em;
  i {
    margin: 0 10px;
    color: var(--grayish-blue);
    cursor: pointer;
    transition: 300ms;
    &:hover {
      color: var(--soft-red);
    }
  }
}
</style>