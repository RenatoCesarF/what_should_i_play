import React from 'react';
import styles from './style.js'
import { View ,Image, Text } from 'react-native'

export default function RightGame(props) {
    //on click in game div, pass the gameID to page and function List 
    return (
      
        <View className="borderDiv" style={styles.borderDiv}>

            <Image 
                style={{width: 110, height: 100, borderRadius: 20, marginVertical: 10}}
                resizeMode="contain"
                source={{uri:`https://images.igdb.com/igdb/image/upload/t_cover_big/${props.game.cover.image_id}.jpg`}}
            />

            <Text className="gameTitle" style={styles.gameTitle}>
                {props.data.name}
            </Text>

        </View>

    )
}

