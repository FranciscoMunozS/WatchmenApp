require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Amount", with: @ticket.amount
    fill_in "Analist", with: @ticket.analist
    fill_in "Bip", with: @ticket.bip
    fill_in "Caution", with: @ticket.caution
    fill_in "Correlative", with: @ticket.correlative
    fill_in "Currency", with: @ticket.currency
    fill_in "Departed date", with: @ticket.departed_date
    fill_in "Departed office", with: @ticket.departed_office
    fill_in "Devolution", with: @ticket.devolution
    fill_in "Due date", with: @ticket.due_date
    fill_in "Memo", with: @ticket.memo
    fill_in "Memo income date", with: @ticket.memo_income_date
    fill_in "Project name", with: @ticket.project_name
    fill_in "Ticket number", with: @ticket.ticket_number
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @ticket.amount
    fill_in "Analist", with: @ticket.analist
    fill_in "Bip", with: @ticket.bip
    fill_in "Caution", with: @ticket.caution
    fill_in "Correlative", with: @ticket.correlative
    fill_in "Currency", with: @ticket.currency
    fill_in "Departed date", with: @ticket.departed_date
    fill_in "Departed office", with: @ticket.departed_office
    fill_in "Devolution", with: @ticket.devolution
    fill_in "Due date", with: @ticket.due_date
    fill_in "Memo", with: @ticket.memo
    fill_in "Memo income date", with: @ticket.memo_income_date
    fill_in "Project name", with: @ticket.project_name
    fill_in "Ticket number", with: @ticket.ticket_number
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
