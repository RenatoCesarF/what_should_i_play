import React from 'react'
import {View} from 'react-native'
import {Form} from '@unform/mobile'
import {FaSearch} from 'react-icons/fa'

import styles from './style'
import Input from './input/input'

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
