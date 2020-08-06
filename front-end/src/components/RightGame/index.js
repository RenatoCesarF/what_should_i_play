import React from 'react';
import { View ,Image, Text } from 'react-native'
import './style'

export function RightGame() {
    //on click in game div, pass the gameID to page and function List 
    return (
        <View>

            <View className="borderDiv">

                <Image 
                    style={{width: 260, height: 300}}
                    resizeMode="contain"
                    source={{uri:"https://images.igdb.com/igdb/image/upload/t_cover_big/co23jy.jpg"}}
                />

                <Text className="gameTitle" style={styles.styles}>
                    Game Name
                </Text>

            </View>

        </View>
    )
}