local Lib = {}

Lib:AddButon(Title, func)
    ButtonItem.Text = Title
    Button.MouseButton1Down:Connect(func)
end
  
return Lib
