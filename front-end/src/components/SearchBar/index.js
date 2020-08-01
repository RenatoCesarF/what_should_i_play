
import React from 'react'
import { View, KeyboardAvoidingView, Button} from 'react-native'
import { Form } from '@unform/mobile'
import { TextInput } from 'react-native-gesture-handler'

import styles from './style'
import Input from './input/input'

const SearchBar = () => {

  function onSubmit(data) {
    console.log('Your input Jogo', data)
  }

  return (
    <View>
      <Form onSubmit={onSubmit}>
        <Input name="Jogo"  returnKeyType="send" onSubmitEditing={onSubmit}/>
      </Form>

      <Button
      title="Botton test subimit"
      onPress={onSubmit}
      />
    </View>
  )
}

export default SearchBar
