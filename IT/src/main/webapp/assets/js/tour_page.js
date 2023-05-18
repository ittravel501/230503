$(document).ready(function() {
        $('#choi').on('change', function() {
            var choi = $(this).val();
            $('#for, #kor, #alist, #blist, #glist, #klist').hide();
            if (choi === '해외여행') {
                $('#for').show();
            } else if (choi === '국내여행') {
                $('#kor').show();
            }
        });
        
        $('#for').on('change', function() {
            var forVal = $(this).val();
            $('#alist, #blist, #glist, #klist').hide();
            if (forVal === '일본') {
                $('#alist').show();
            } else if (forVal === '동남아') {
                $('#blist').show();
            }
        });
        
        $('#kor').on('change', function() {
            var korVal = $(this).val();
            $('#glist, #klist').hide();
            if (korVal === '강원도') {
                $('#glist').show();
            } else if (korVal === '제주도') {
                $('#klist').show();
            }
        });
    });
    
    