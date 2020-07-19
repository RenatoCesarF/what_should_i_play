import React from 'react'
import {View, } from 'react-native'
import {Form} from '@unform/mobile'

import styles from './style'
import Input from './input/input'
import { TextInput } from 'react-native-gesture-handler';

const SearchBar = () => {
  
    return (
      <View>



        <Form>
            <Input name="Jogo" />
        </Form>


      </View>
    );
};

export default SearchBar;
