<template>
  <div class="chat" v-if="this.$store.getters.role.role.find(item => item  == 'client') != 'client'" @click="chatHeight = 30" v-click-outside="onClickOutside">
    <!-- {{chatMessages}} -->
    <el-tabs  v-model="editableTabsValue" tab-position="top" @tab-click="tabclick">
      <!-- таб для чтения чата юзеров тех кто вступил в клан -->
<!--       <el-tab-pane label="User" v-if="this.$store.getters.role.role != 'user'">
        <el-container class="chatWindow" v-bind:style="{height: this.chatHeight +'vh'}" >
          <el-main v-chat-scroll="{always: false, smooth: true, scrollonremoved:true}" >
            <div v-for="(item, index) in userChatMessages" class="mediumtext">
              <div class="chatString">
                <div class="nickname">
                   {{item.username}} 
                </div>
                <div class="smalltext chatstroke">
                  {{item.text}}            
                </div>             
              </div>
            </div>
            
            <div v-if="this.blank == true"></div> 
          </el-main>
        </el-container>        
      </el-tab-pane> -->

<!--       <el-tab-pane :label="this.$store.getters.role.role">
        <el-container class="chatWindow" v-bind:style="{height: this.chatHeight +'vh'}" >
          <el-main v-chat-scroll="{always: false, smooth: true, scrollonremoved:true}"  >
            <div v-for="(item, index) in chatMessages" class="mediumtext">
              <div class="chatString">
                <div class="nickname">
                  {{item.username}}  
                </div>
                <div class="smalltext chatstroke">
                  {{item.text}}            
                </div>            
              </div>
            </div>
            
            <div v-if="this.blank == true"></div> 
          </el-main>
        </el-container>
      </el-tab-pane> -->
    <template v-for="(item, index) in this.$store.getters.role.role" class="mediumtext" v-if="item != 'lead' && item != 'elder'">

      <el-tab-pane :label="item" >  
        <el-container class="chatWindow" v-bind:style="{height: chatHeight +'vh'}" >
          <el-main v-chat-scroll="{always: false, smooth: true, scrollonremoved:true}"  >
            <div v-for="(itemch, index) in AllMessages" class="mediumtext" v-if="itemch.clan == item">
              <div class="chatString">
                <div class="nickname">
                  {{itemch.username}}  
                </div>
                <div class="smalltext chatstroke">
                  {{itemch.text}}            
                </div>            
              </div>
            </div>
            
            <div v-if="blank == true"></div> 
          </el-main>
        </el-container>
      </el-tab-pane>
    </template>

    <div class="inputZone" v-on:keyup.enter="postingMes" v-if="tabinput == true">
      <el-input size='mini'class="inputStroke" placeholder="сообщение в чат" v-model="input"></el-input>
      <el-button size='mini' @click="postingMes">отправить</el-button>      
    </div>

      <el-tab-pane label="системные" >
        <el-container class="chatWindow" v-bind:style="{height: this.chatHeight +'vh'}" >
          <el-main v-chat-scroll="{always: false, smooth: true, scrollonremoved:true}" > 
 
            <div v-for="(item, index) in inboxMessages" class="mediumtext">
              <div class="chatString">
                <div class="nickname">
                  <div v-if="item.clan == 'superadmin'">
                    *инф*
                  </div>
                  <div v-else>
                    {{item.clan }} 
                  </div>
                   
                </div>
                <div class="smalltext chatstroke">
                  {{item.text}}            
                </div>        
              </div>
            </div>
  
            <div v-if="this.blank == true"></div> 
          </el-main>
        </el-container>
      </el-tab-pane>
    </el-tabs>
    
    <!-- <div class='messages'>123</div> -->


  </div>
</template>

<script>
import vClickOutside from 'v-click-outside'
import axios from 'axios'
export default {
  directives: {
    clickOutside: vClickOutside.directive
  },
  data: function () {
    return {
      editableTabsValue: '0', 
      blank: false,
      // scroll: false,
      tabinput: true,
      inboxMessages: '',
      // chatUserMessages: '',
      chatHeight: 12,
      exptime: '',
      input: '',
      userChatMessages: '',
      chatMessages: '',
      AllMessages: ''
    };
  },
  methods: {
    tabclick(targetName){
      //костыль для скролла чата при переключении табов
      var self = this
      setTimeout(function(){
        // self.cropText();
        self.blank = true
        // console.log('true')
        setTimeout(function(){
          self.blank = false
          // console.log('false')
        },5 );
      },10 );   

      // console.log(targetName.label)
      if(targetName.label == 'системные'){
        this.tabinput = false
      }else{
        this.tabinput = true
      }
    },
    onClickOutside (event) {
      console.log('Clicked outside. Event: ', event)
      this.chatHeight = 12
    },
    checkRelevanceToken(){
      this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
    },    
    addMessage(data){
      console.log(data)
      if (data.username == 'system'){
        this.inboxMessages = this.inboxMessages.concat(data);   
      }else{
        this.AllMessages = this.AllMessages.concat(data);        
      }
    },
    postingMes: function(event){
      let tabIdent = this.$store.getters.role.role[this.editableTabsValue]

      // console.log(tabIdent)
       axios({
        method: 'post',
        //vks#associate
        url: '/api/v1/chat',
        data: {
          text: this.input,
          clan_name: tabIdent
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        this.input = ''
      })
    },
    getSystemChat(){
      axios({
      method: 'get',
      url: '/api/v1/chat',
      params: {
        clan: 'superadmin',
        user_id: this.$store.getters.role.user_id
      }, 
      headers: {
        'Authorization': 'bearer '+this.$store.getters.token.access
      } 
      })
      .then((response) => { 
        var total = response.data
        this.inboxMessages = total
      });      
    },  
    getAllChat(role){
      axios({
      method: 'get',
      url: '/api/v1/chat',
      params: {
        clan: role
      }, 
      headers: {
        'Authorization': 'bearer '+this.$store.getters.token.access
      } 
      })
      .then((response) => { 
        var total = response.data
        this.AllMessages = total
      });      
    },            
    getUserChat(){
      axios({
      method: 'get',
      url: '/api/v1/chat',
      params: {
        clan: "user"
      }, 
      headers: {
        'Authorization': 'bearer '+this.$store.getters.token.access
      } 
      })
      .then((response) => { 
        var total = response.data
        this.userChatMessages = total
      });      
    },    
    // getChat(role){
    //   axios({
    //   method: 'get',
    //   url: '/api/v1/chat',
    //   params: {
    //     clan: role
    //   }, 
    //   headers: {
    //     'Authorization': 'bearer '+this.$store.getters.token.access
    //   } 
    //   })
    //   .then((response) => { 
    //     var total = response.data
    //     this.chatMessages = total
    //   });      
    // }
  },
  watch: {
    exptime() {
      var trig = false;
      var self = this;
      if ((this.exptime > 0)&&(!trig)){
        // self.getChat(this.$store.getters.role.role)
        self.getUserChat()
        self.getSystemChat()
        self.getAllChat(this.$store.getters.role.role)
        var trig = true;     
      }
    }
  }, 
  mounted() { 
    var pusher = new Pusher('80417a1d08d2e56e2b85', {
      cluster: 'eu',
      forceTLS: true
    });
    var channel = pusher.subscribe('messages' );
    var channel1 = pusher.subscribe( 'system');
    var self = this;
 
    this.$store.getters.role.role.forEach(function(entry) {
      // console.log(entry);

      channel.bind(entry, function(data) {
        // console.log(data);

        self.addMessage(data);
      }); 
    });
 
     channel1.bind('world', function(data) {
       if (data.code == 'dead'){
        console.log('KILL')
        console.log(data.text)
        }

     });
    channel1.bind(this.$store.getters.role.user_id, function(data) {
       if (data.code == 'dead'){
         self.$store.commit('deadsend', true )
         self.$store.commit('killsend', data.exptime )
        }
      self.addMessage(data);
    }); 
    var timer1 = setInterval(function(){
      self.checkRelevanceToken()
      if (self.exptime > 0){
        clearInterval(timer1) 
      }         
    },50 );       
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";

.chatHead{
  display: flex;
  flex-direction: row;
  height: 1.6em;
  div{
    padding: 0 0.5em;
    margin: 0 0.1em;
    background-color: #333;
  }
}
.chatstroke {
    font-weight: 300;
    color: $color-5;
}
.nickname{
  margin: 0.0em 0.3em 0 0;
  border-radius: 0.4em;
  /*background-color: $HeadBackColor;*/
  background-color: color( $HeadBackColor  blackness(80%));
  font-size: 12px;
  color: $str2;

  padding: 0 0.3em 0.1em 0.4em;
}
.chatString{
  display: flex;
  flex-direction: row;
  margin-top: 0.3em;
}
.chatWindow{
  margin: 0.0em 0.2em;
  /*height: 80px; */
  border: 1px 
  solid #555;
}
.inputStroke{
  padding: 3px 0.0em 0 0;
}
.inputZone{
  /*padding: 0.2em 0em;*/
  display: flex;
  flex-direction: row;
}
.el-main {
  padding: 5px 7px;
  /*background-color: #E9EEF3;*/
  /*color: #333;*/
  text-align: left;
  /*line-height: 160px;*/
}
.messages{
  padding: 0.2em 0.5em;
}
.chat {
  padding: 0.2em;
  /*background-color: #dad;*/
}


</style>