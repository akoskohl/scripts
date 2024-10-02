from vertexai.generative_models import FunctionDeclaration, Tool, ToolConfig, GenerativeModel, GenerationConfig, Content, Part

# Define the function declarations
reverse = FunctionDeclaration(
    name="reverse",
    description="Reverses the order of a string and returns the result.",
    parameters={
        "type": "object",
        "properties": {
            "s": {
                "type": "string",
                "description": "The string to be reversed"
            }
        },
        "required": ["s"]
    }
)

remove_white_spaces = FunctionDeclaration(
    name="remove_white_spaces",
    description="Removes all white space characters from a string and returns the result.",
    parameters={
        "type": "object",
        "properties": {
            "s": {
                "type": "string",
                "description": "The string from which white spaces will be removed"
            }
        },
        "required": ["s"]
    }
)

# Create the Tool object
tool = Tool(
    function_declarations=[reverse, remove_white_spaces],
)

user_prompt_content = Content(
    role="user",
    parts=[
        Part.from_text("Please reverse the string 'Hello World' and remove white spaces."),
    ],
)

def handle_response(response):
    # If there is a function call then invoke it
    # Otherwise print the response.
    if response.candidates[0].function_calls:
        function_call = response.candidates[0].function_calls[0]
    else:
        print(response.candidates[0].text)
        return
    
    # Check which function is being called
    if function_call.name == "reverse":
        # Extract the arguments to use in your function
        args = function_call.parameters
        s = args.get("s").string_value
        
        # Call your function
        result = reverse_string(s)
        
        # Send the result back to the chat session with the model
        print(f"Result of reverse: {result}")
        
        # Recursive call to handle further function calls
        handle_response(response)
    
    elif function_call.name == "remove_white_spaces":
        # Extract the arguments to use in your function
        args = function_call.parameters
        s = args.get("s").string_value
        
        # Call your function
        result = remove_white_spaces(s)
        
        # Send the result back to the chat session with the model
        print(f"Result of remove_white_spaces: {result}")
        
        # Recursive call to handle further function calls
        handle_response(response)
    
    else:
        # You shouldn't end up here
        print(f"Unexpected function call: {function_call}")

# Example usage
model = GenerativeModel(
    model_name="gemini-1.5-pro-001",
    generation_config=GenerationConfig(temperature=0),
    tools=[tool],
    tool_config=ToolConfig(
        function_calling_config=ToolConfig.FunctionCallingConfig(
            mode=ToolConfig.FunctionCallingConfig.Mode.ANY,
            allowed_function_names=["reverse", "remove_white_spaces"],
        )
    ),
    system_instruction="Fulfill the user's instructions. If asked to reverse a string or remove whitespace, call the provided functions. You may call one function after the other if needed. Repeat the result to the user."
)

response = model.generate_content(
    user_prompt_content,
    generation_config={"temperature": 0},
    tools=[tool],
    tool_config=ToolConfig(
        function_calling_config=ToolConfig.FunctionCallingConfig(
            mode=ToolConfig.FunctionCallingConfig.Mode.ANY,
            allowed_function_names=["reverse", "remove_white_spaces"],
        )
    )
)
handle_response(response)