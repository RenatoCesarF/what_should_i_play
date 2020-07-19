import React from 'react'
import {View, } from 'react-native'
import {Form} from '@unform/mobile'
import { FontAwesome } from '@expo/vector-icons'; 

import styles from './style'
import Input from './input/input'
import { TextInput } from 'react-native-gesture-handler';

const SearchBar = () => {
  
    return (
      <View>

          
          <View style={styles.search}>

            <View>
              <FontAwesome style={{zIndex: 1}}name="search" size={30} color="#F21B3F"/>
            </View>

            <TextInput>dddd</TextInput>
            <View>
              <FontAwesome style={{zIndex: 5}}name="remove" size={30} color="#2d2d2d"/>  
            </View>

          </View>

        <Form style={{zIndex: 2}}>
            <Input name="Jogo" />
        </Form>


      </View>
    );
};

export default SearchBar;
