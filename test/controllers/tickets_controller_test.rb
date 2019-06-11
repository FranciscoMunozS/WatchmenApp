require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { amount: @ticket.amount, analist: @ticket.analist, bip: @ticket.bip, caution: @ticket.caution, correlative: @ticket.correlative, currency: @ticket.currency, departed_date: @ticket.departed_date, departed_office: @ticket.departed_office, devolution: @ticket.devolution, due_date: @ticket.due_date, memo: @ticket.memo, memo_income_date: @ticket.memo_income_date, project_name: @ticket.project_name, ticket_number: @ticket.ticket_number } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { amount: @ticket.amount, analist: @ticket.analist, bip: @ticket.bip, caution: @ticket.caution, correlative: @ticket.correlative, currency: @ticket.currency, departed_date: @ticket.departed_date, departed_office: @ticket.departed_office, devolution: @ticket.devolution, due_date: @ticket.due_date, memo: @ticket.memo, memo_income_date: @ticket.memo_income_date, project_name: @ticket.project_name, ticket_number: @ticket.ticket_number } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
