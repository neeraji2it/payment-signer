class PaymentMailer < ActionMailer::Base
  default from: "support@rising-sun.com.au"

  def payment_confirmation(payment)
    @payment = payment
    mail(to: @payment.email, subject: 'Please confirm payment and sign it')
  end

  def payment_pdf(payment)
    @payment = payment
    mail(to: @payment.email, subject: 'You Payment was confirmed and signed')
  end
end