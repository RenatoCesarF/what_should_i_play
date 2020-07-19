import React from 'react';
import styles from './style'
import { View, Text, StatusBar, Image, Linking } from 'react-native';
import { useNavigation, useRoute} from '@react-navigation/native'
import { FontAwesome } from '@expo/vector-icons'; 

function Details(){

  const navigation = useNavigation();

  function ytRedirect(){ // função que redireciona para uma busca pelo nome do jogo no YT
    Linking.openURL(`https://www.youtube.com/results?search_query=nome+do+jogo`);
  }
  function steamRedirect(){
    Linking.openURL(`https://store.steampowered.com/search?term=nome+do+Jogo`)
  }

  return(
    <View style={ styles.container}>

      <View style={styles.header}>
        <FontAwesome name="arrow-left" color="#F21B3F" size={27}
            onPress={() =>  navigation.goBack()}
        />
        <FontAwesome name="bookmark" color="#F21B3F" size={27}/>
      </View>

      <View>
        <Image source={{uri:"https://lojasaraiva.vteximg.com.br/arquivos/ids/3265309/1008083018.jpg"}}/>
      </View>

      <View style={styles.details}>

        <Text style={styles.topic}> Name:</Text>
        <Text style={styles.topic}> Genre:</Text>
        <Text style={styles.topic}> Developer:</Text>
        <Text style={styles.topic}> Launch: </Text>
        <Text style={styles.topic}> Available on:</Text>

        <Text style={styles.action} onPress={ytRedirect}>
          <FontAwesome name="youtube-play" color="#F21B3F" size={35} onPress={ytRedirect}/>
          Watch a Gameplay
        </Text>

        <Text style={styles.action} onPress={steamRedirect} >
          <FontAwesome name="credit-card-alt" color="#F21B3F" size={27} onPress={steamRedirect}/>
          Buy
        </Text>
        
      </View>

      <StatusBar style="auto" />
    </View>
);
}


// on click in setinha navigation.pop();  navigation.navigate('List')

export default Details;