<template>
  <div :class="[{flexStart: step === 1}, 'wrapper']">
      <transition name="slide">
          <img src="../assets/logo.png" class="logo" v-if="step === 1" />
      </transition>
      <a href="#" class="btnBack" v-if="step === 1" @click="handleReturn()">Back</a>
      <transition name="fade">
          <Showcase v-if="step === 0"/>
      </transition>
      <Claim v-if="step === 0" />
      <SearchInput v-model="searchValue" @input="handleInput" :dark="step === 1"/>
      <div class="results" v-if="results && !loading && step === 1">
          <Item v-for="item in results" :item="item" :key="item.data[0].nasa_id" @click.native="handleModalOpen(item)"/>
      </div>
      <div class="loader" v-if="loading"></div>
      <Modal v-if="modalOpen" :item="modalItem" @closeModal="modalOpen = false"/>
  </div>
</template>

<script>
import axios from 'axios';
import debounce from 'lodash.debounce';
import Showcase from '@/components/Showcase.vue';
import Claim from '@/components/Claim.vue';
import SearchInput from '@/components/SearchInput.vue';
import Item from '@/components/Item.vue';
import Modal from '@/components/Modal.vue';

const API = 'https://images-api.nasa.gov/search';

export default {
  name: 'Home',
  components: {
      Claim,
      SearchInput,
      Showcase,
      Item,
      Modal,
  },
  // data in component must be an object returning function
  // variable to be reactive, must be initialised in data
  data() {
      return {
          modalOpen: false,
          modalItem: null,
          loading: false,
          step: 0,
          searchValue: '',
          results: [],
      };
  },
  methods: {
      handleModalOpen(item) {
          this.modalOpen = true;
          this.modalItem = item;
      },
      handleReturn() {
          this.step = 0;
          this.searchValue = '';
      },
      // use lodash.debounce method to wait 0.5s until sending a query to server
      // eslint-disable-next-line
      handleInput: debounce(function() {
          this.loading = true;
          // 'this' must be used when variable inside script is our target
          // console.log(this.searchValue);
          axios.get(`${API}?q=${this.searchValue}&media_type=image`)
            .then((response) => {
                // console.log(response.data.collection.items);
                this.results = response.data.collection.items;
                this.loading = false;
                this.step = 1;
            })
            .catch((error) => {
                console.log(error);
            });
      }, 500),
  },
};
</script>
<style lang="scss" scoped>

    .fade-enter-active, .fade-leave-active {
        transition: opacity .3s ease;
    }

    .fade-enter, .fade-leave-to {
        opacity: 0;
    }

    .slide-enter-active, .slide-leave-active {
        transition: margin-top .3s ease;
    }

    .slide-enter, .slide-leave-to {
        margin-top: -50px;
    }

    .wrapper {
        position: relative;
        margin: 0;
        width: 100%;
        min-height: 100vh;
        padding: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;

        &.flexStart {
            justify-content: flex-start;
        }
    }

    .logo {
        position: relative;
        top: 15px;
        width: 75px;
    }

    a {
        text-decoration: none;
        color: #425468;
        text-transform: uppercase;
        font-size: 1.4em;
    }

    .btnBack {
        position: relative;
        top: 25px;
        border: 1px solid #41B883;
        border-radius: 20px;
        padding: 5px 30px;
    }

    .btnBack:hover {
        border: 1px solid #425468;
        background-color: #425468;
        color: #41B883;
    }

    .results {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 20px;
        margin-top: 50px;

        @media (min-width: 768px) {
            grid-template-columns: 1fr 1fr 1fr;
        }
    }

    .loader {
      margin-top: 50px;
      display: inline-block;
      width: 64px;
      height: 64px;
    }
    .loader:after {
      content: " ";
      display: block;
      width: 46px;
      height: 46px;
      margin: 1px;
      border-radius: 50%;
      border: 5px solid #000;
      border-color: #000 transparent #000 transparent;
      animation: loading 0.5s linear infinite;
    }
    @keyframes loading {
      0% {
        transform: rotate(0deg);
      }
      100% {
        transform: rotate(360deg);
      }
    }



</style>
