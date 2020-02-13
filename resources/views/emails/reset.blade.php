@component('mail::message')
# Introduction

Your reset code is : {{$code}}

<!-- @component('mail::button', ['url' => ''])
Button Text
@endcomponent -->

Thanks,<br>
{{ config('app.name') }}
@endcomponent
