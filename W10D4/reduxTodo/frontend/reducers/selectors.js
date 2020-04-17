const selectors = (state) => {
    return(Object.keys(state.todos).map((el)=>{
        return state.todos[el]
    }))

};
export default selectors;
