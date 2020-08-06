import React from 'react';
import styles from './style.js'
import { View ,Image, Text } from 'react-native'

export default function RightGame() {
    //on click in game div, pass the gameID to page and function List 
    //TODO: add props to text and image URI
    return (
      
        <View className="borderDiv" style={styles.borderDiv}>

            <Image 
                style={{width: 110, height: 100, borderRadius: 20, marginVertical: 10}}
                resizeMode="contain"
                source={{uri:"https://images.igdb.com/igdb/image/upload/t_cover_big/co23jy.jpg"}}
            />

            <Text className="gameTitle" style={styles.gameTitle}>
                Game Name
            </Text>

        </View>

    )
}

