require_relative '../../../../apps/web/controllers/tasks/show'

RSpec.describe Web::Controllers::Tasks::Show do
  let(:action) { described_class.new }
  let(:task) { TaskRepository.new.create(title: 'test') }
  let(:params) { { id: task.id } }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  describe 'expose' do
    context '#task' do
      it 'returns task by id' do
        action.call(params)
        expect(action.task).to eq task
      end
    end
  end
end
