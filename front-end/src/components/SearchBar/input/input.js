

import React, { useEffect, useImperativeHandle, forwardRef, useRef } from 'react'
import { useField } from '@unform/core'
import { TextInput, View } from 'react-native'

import styles from './style'

function Input({ name }, ref) {
  const { registerField, defaultValue = "", fieldName, error } = useField(name)
  const inputRef = useRef(null)
  const inputValueRef = useRef({ value: defaultValue })

  useImperativeHandle(ref, () => ({
    focus() {
      inputRef.current.focus()
    },
  }))

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: inputValueRef.current,
      path: 'value',
      setValue(value) {
        inputValueRef.current.value = value
        inputRef.current.setNativeProps({ text: value })
      },
      clearValue() {
        inputValueRef.current.value = ''
        inputRef.current.clear()
      },
    })
  }, [fieldName, registerField])

  return (
    <View>
     
      
      <TextInput
        ref={inputRef}
        style={styles.areaPesquisa}
        defaultValue={defaultValue}
        onChangeText={value => {
          inputValueRef.current.value = value
        }}
      />
    </View>
  )
}

export default forwardRef(Input)
