import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from '../actions/actions';

export default (view) => connect(state => ({
		state: state.store
	}),
	(dispatch) => ({
		actions: bindActionCreators(actions, dispatch)
	})
)(view);
