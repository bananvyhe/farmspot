/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import TurbolinksAdapter from 'vue-turbolinks';
// Vue.use(TurbolinksAdapter)

// import Vue from 'vue/dist/vue.esm.js'
import Vue from 'vue'
import axios from 'axios'
// import TurbolinksAdapter from 'vue-turbolinks'
// Vue.use(TurbolinksAdapter)
// import App from '../app.vue'
import Reg from '../components/registration.vue'
import Log from '../components/login.vue'
import Head from '../head.vue'
import Headvk from '../headvk.vue'
import Boar from '../boar.vue'
import Topsidepanel from '../topsidepanel.vue'
import Request from '../components/request.vue'
import Hat from '../hat.vue'
import VmBackTop from '../back-top.vue'
import Filther from '../components/filther.vue'
import Addpublic from '../components/addpublic.vue'
// import Topsection from '../components/topsection.vue'
// Vue.component('topsection', Topsection)
// import Currentrole from '../railsvars/currentrole.vue'
// Vue.component('currentrole', Currentrole)
import '../../../public/theme/index.css'
Vue.component('reg', Reg)
Vue.component('log', Log)
Vue.component('request', Request)
Vue.component('filther', Filther)
Vue.component('addpublic', Addpublic)

Vue.component("temperature", {
  template: "#temperature-template",
  data: function() {
    return {temp: '123', location: null};
  },
  created: function() {
    // this.fetchData();
  },
  methods: {
  	reload: function() {
  		location.reload(true);
  		// window.location.href = window.location.href;
  	},
  	deleteuser: function(id ) {
  		axios.delete('/users/'+id, {
  		// 	headers: {
  		// 		'Authorization': "bearer " + this.$store.getters.token 
				// } 
  		})
  		.then(response => {
  			var ids = String(id)
  			var dd = ".userstring.del"+ids 
  			console.log(dd)
  			$(dd).fadeOut(200);
		    // location.reload(true);
		  })
  	}

  }
});
import store from 'store'
import createPersistedState from 'vuex-persistedstate'
 
import {Transfer, Card, Slider, Icon, Popover, Notification, Progress, Button, Switch, Dialog, Select, Form, FormItem, Input, Option, Message, Checkbox, Carousel, CarouselItem, Loading} from 'element-ui';
Vue.prototype.$message = Message; 
Vue.prototype.$ELEMENT = { size: 'small', zIndex: 2000 }; 
Vue.use(Transfer);
Vue.use(Card);
Vue.use(Slider)
Vue.use(Icon)
Vue.use(Popover)
Vue.use(Progress) 
Vue.use(Button) 
Vue.use(Dialog)  
Vue.use(Form)  
Vue.use(FormItem)  
Vue.use(Input)  
Vue.use(Select)
Vue.use(Option)
Vue.use(Checkbox)
Vue.use(Switch)
Vue.use(Carousel)
Vue.use(CarouselItem)
Vue.use(Loading.directive);
Vue.prototype.$notify = Notification;
document.addEventListener('turbolinks:load', () => {
  // const el = document.body.appendChild(document.createElement('hello'))
  // const app = new Vue({
  //   el,
  //   render: h => h(App)
  // })
 //  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	// axios.defaults.headers.common['X-CSRF-Token'] = token
	// axios.defaults.headers.common['Accept'] = 'application/json'
	// var users = document.getElementById("users") 
 //  if (users != null) {
	// 	new Vue({
	// 	store,
	// 	  el: "#users" 
	// 	})
	// }
 
	new Vue({
    el: '#VmBackTop',
    render: h => h(VmBackTop)
  })
	var hat = document.getElementById("hat") 
  if (hat != null) {
	  new Vue({
	  	store,
	    el: '#hat',
	    render: h => h(Hat) 
	  })
	}
	var users = document.getElementById("users") 
  if (users != null) {
	  new Vue({
	  	store,
	    el: '#users',
	    
	  })
	}
	var topsidepanel = document.getElementById("topsidepanel") 
  if (topsidepanel != null) {
	  new Vue({
	  	store,
	    el: '#topsidepanel',
	    render: h => h(Topsidepanel) 
	  })
	}
	var head = document.getElementById("head") 
  if (head != null) {
	  new Vue({
	  	store,
	    el: '#head',
	    render: h => h(Head) 
	  })
	}
	var headvk = document.querySelector('#headvk')
  if (headvk != null) {
	  new Vue({
	  	store,
	    el: headvk,
	    data: {
				 
			},
	    template: "<Headvk/>",
			components: {Headvk} 
	  })
	}
	// var log = document.getElementById("log") 
 //  if (log != null) {
	//   new Vue({
	//   	store,
	//     el: log,
	//     render: h => h(Log) 
	//   })
	// }
	// var reg = document.getElementById("reg") 
 //  if (reg != null) {
	//   new Vue({
	//   	store,
	//     el: '#reg',
	//     render: h => h(Reg) 
	//   })
	// }
	var boards = document.querySelector('#boards')
	if (boards != undefined) {
		const app = new Vue({
			el: boards,
			store,
			data: {
				lists: JSON.parse(boards.dataset.lists)
			},
			template: "<Boar :original_lists='lists' />",
			components: { Boar  } 
		})
	}
	// new Vue({
	// 	el: '[data-behavior="vue1"]' 
	// })
	var currentrole = document.querySelector('.currentrole')
	if (currentrole != undefined) {
		new Vue({
			store,
	    components: { Currentrole }
	  }).$mount('.currentrole')
	}
	// var topsection = document.querySelector('.topsection')
	// if (topsection != undefined) {
	// 	new Vue({
	// 		store,
	//     components: { Topsection }
	//   }).$mount('.topsection')
	// }
	// var reg = document.querySelector('#reg')
	// if (reg != undefined) {
	// 	new Vue({
	// 		el: '#reg',
	// 		render: h => h(Reg)
	// 	})
	// }
	jQuery(function($){
	$(".deleteAction").click( function(){
		var current_item_tr = $(this).parents('tr')[0];
		if(confirm("Точно удалить?")){
			$.ajax({
				beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				url: window.location.href + '/posts/' + $(current_item_tr).attr('data-item_id'),
				type: 'POST',
				data: { _method: 'DELETE'},
				success: function(){
					$(current_item_tr).fadeOut(200);
				}
			});
		};
	});
});
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the using turbolinks, install 'vue-turbolinks':
//
// yarn add 'vue-turbolinks'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//delete destroy withowt refresh page rails

