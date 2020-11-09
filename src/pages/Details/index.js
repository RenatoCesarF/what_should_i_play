/*
name,
image,
year,
rating,
genresNames,
developer,
platformsNames
*/
import React, { useState, useEffect }from 'react';
import { View, Text, StatusBar, Image, Linking, ScrollView, SafeAreaView } from 'react-native';
import { useNavigation,RectButton } from '@react-navigation/native'
import { FontAwesome } from '@expo/vector-icons'; 

import styles from './style'
import Api from './ApiDetails'
import { set } from 'react-native-reanimated';


//on open, run function Details() with game id that comes from list

export default function Details() {

  const navigation = useNavigation();

  function ytRedirect() { // This function redirect you to a gameplay of the game
    Linking.openURL(`https://www.youtube.com/results?search_query=nome+do+jogo`);
  }
  function steamRedirect() { // This function redirect you to steam store of the game
    Linking.openURL(`https://store.steampowered.com/search?term=nome+do+Jogo`)
  }


  const [info, setInfo] = useState([])

  useEffect(() => {
    async function LoadInfo() {
      const response = await Api.Details(1422)
      const data = await response

      await setInfo(data)
    }
    
    LoadInfo()
  }, []);

  const NAME = 'a'
  const DEV = developer[0];
  const GENRES = data.genresNames;
  const IMAGE = data.cover.Image_id;
  const LAUNCH = '';
  const PLATFORMS = '';
  const RAITING = '';

  return (
    
    <SafeAreaView style={styles.container}>
      <ScrollView>

        <View style={styles.header}>
          <FontAwesome name="arrow-left" color="#F21B3F" size={27}
              onPress={() =>  navigation.goBack()}
          />
          <FontAwesome name="bookmark" color="#F21B3F" size={27}/>
        </View>

        <View style={styles.imageView}>
          <Image 
            style={{width: 225, height: 300, backgroundColor: '#282243'}}
            resizeMode="contain"
            source={{uri:`https://images.igdb.com/igdb/image/upload/t_cover_big/${IMAGE}.jpg`}}//
            />
        </View>

        <View style={styles.details}>

        <Text style={styles.topic}> Name: {`${NAME}`}</Text>
        <Text style={styles.topic}> Genre: {`${GENRES}`}</Text>
        <Text style={styles.topic}> Developer: {`${DEV}`}</Text>
        <Text style={styles.topic}> Launch: {`${LAUNCH}`}</Text>
        <Text style={styles.topic}> Available on: {`${PLATFORMS}`}</Text>
        <Text style={styles.topic}> Rating on IGDB: {`${RAITING}`}</Text>

        <Text style={styles.action} onPress={ytRedirect}>
          <FontAwesome name="youtube-play" color="#F21B3F" size={30} onPress={ytRedirect}/>
          Watch a Gameplay
        </Text>

        <Text style={styles.action} onPress={steamRedirect} >
          <FontAwesome name="credit-card-alt" color="#F21B3F" size={27} onPress={steamRedirect}/>
          Buy
        </Text>
          
        </View>

        <StatusBar style="auto" />

      </ScrollView>
    </SafeAreaView>
);
}


// on click in setinha navigation.pop();  navigation.navigate('List')