<template>
  <div class="searchWrapper">
      <input
            id="search"
            name="search"
            placeholder="e.g. Mars"
            :class="{ dark }"
            :value="value"
            @input="handleChange"
      />
  </div>
</template>

<script>
export default {
  name: 'SearchInput',
  props: {
    value: {
        type: String,
        required: true,
    },
    dark: {
        type: Boolean,
        default: false,
    }
  },
  methods: {
    handleChange(e) {
        this.$emit('input', e.target.value);
    },
  },
};
</script>

<style lang="scss" scoped>

    .searchWrapper {
        margin-top: 50px;
        display: flex;
        flex-direction: column;
        width: 250px;

        @media (min-width: 1024px) {
            width: 350px;
        }
    }

    input {
        color: #fff;
        text-align: center;
        font-size: 1.4em;
        text-transform: uppercase;
        font-family: 'Montserrat', sans-serif;
        font-weight: 200;
        height: 30px;
        border: 0;
        border-bottom: 1px solid #fff;
        background: none;
        transition: box-shadow 0.5s ease-out;
        margin-top: 50px;


        @media (min-width: 1024px) {
            font-size: 1.8em;
        }
    }

    input:focus {
        outline: none;
        box-shadow: 0 10px 20px -7px rgba(255,255,255, 0.4);
    }

    input:focus::placeholder {
        color: transparent;
    }

    input::placeholder {
        color: rgba(255,255,255,0.35);
        text-transform: none;
        font-size: 1.8em;
        font-family: 'Montserrat', sans-serif;
    }

    .dark {
        color: #000;
        border-bottom-color: #000;
    }

    .dark:focus {
        box-shadow: 0 10px 20px -8px rgba(#000, 0.5);
    }

</style>
