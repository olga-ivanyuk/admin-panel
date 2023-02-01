@php
    if(!isset($name)){
    $name = (string) str($label)->snake();
    }
    $old = old($name)
@endphp

<div class="form-group">
    <label for="{{ str($label)->slug() }}">{{ $label }}</label>
    <input type="text"
           id="{{ str($label)->slug() }}"
           class="form-control my-colorpicker colorpicker-element"
           data-colorpicker-id="1"
           data-original-title=""
           style="width: 90px;"
           name="{{ $name }}"
    @if(isset($value)||isset($old))
        value="{{ isset($value) ? old($name, $value) :old($name) }}"
    @endif
    title="">

    @error($name)
    {{ $message }}
    @enderror
</div>
