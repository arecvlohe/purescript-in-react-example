import PSCounter from "./PureScript/output/Counter";
const state = { count: 0 };
export const Counter = PSCounter.toReact(state)();
